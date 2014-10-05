class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow

    # NSUserDefaults.standardUserDefaults.removeObjectForKey("lt.danie.hacks.boop.tokens.group")
    # NSUserDefaults.standardUserDefaults.removeObjectForKey("lt.danie.hacks.boop.tokens.user")

    NSApplication.sharedApplication.registerForRemoteNotificationTypes(1 << 2)
  end

  def application(app, didRegisterForRemoteNotificationsWithDeviceToken: token)
    puts "Token: #{token.description}"

    create_group(token) unless tokens.has_group_tokens? && tokens.has_user_tokens?

    buildQR(group_uuid)
    buildQRView(@QRImage)
  end

  def application(app, didFailToRegisterForRemoteNotificationsWithError: error)
    puts "Failed to register for token with error: #{error.description}"
  end

  def application(app, didReceiveRemoteNotification:userInfo)
    notification = PushNotification.alloc.initWithUserInfo(userInfo)
    url_string = "https://boop.ngrok.com/api/v1/messages/#{notification.message}/content".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet)

    puts "Notification message: #{notification.message}"
    NSWorkspace.sharedWorkspace.openURL(NSURL.URLWithString(url_string))
  end

  def api
    @api_manager ||= APIManager.alloc.init
  end

  def create_group(push_token)
    tokens.group_token = group_uuid
    tokens.user_token = device_uuid

    api.create_group(device_uuid, group_uuid, push_token.description)
  end

  def tokens
    @token_manager ||= TokenManager.alloc.init
  end

  def group_uuid
    @group_uuid = @token_manager.group_token || NSUUID.UUID.UUIDString
  end

  def device_uuid
    @device_uuid = @token_manager.user_token || NSUUID.UUID.UUIDString
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [320, 320]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end
  
  def buildQR(uuid)
    @QRImage ||= QRManager.create(uuid, 320)
  end
  
  def buildQRView(qr_code_image)
    @imageView = NSImageView.alloc.initWithFrame(NSMakeRect (0, 0, 320, 320))
    @imageView.image = qr_code_image
    @mainWindow.contentView.addSubview(@imageView)
  end
end

class PushNotification
  def initWithUserInfo(userInfo)
    init

    @info = userInfo

    self
  end

  def message?
    message != nil
  end

  def message
    @info["aps"]["alert"]
  end
end

class TokenManager
  def has_group_tokens?
    group_token != nil
  end

  def has_user_tokens?
    user_token != nil
  end

  def group_token=(token)
    NSUserDefaults.standardUserDefaults.setObject(token, forKey:"lt.danie.hacks.boop.tokens.group")
    NSUserDefaults.standardUserDefaults.synchronize
  end

  def group_token
    NSUserDefaults.standardUserDefaults.objectForKey("lt.danie.hacks.boop.tokens.group")
  end

  def user_token=(token)
    NSUserDefaults.standardUserDefaults.setObject(token, forKey:"lt.danie.hacks.boop.tokens.user")
    NSUserDefaults.standardUserDefaults.synchronize
  end

  def user_token
    NSUserDefaults.standardUserDefaults.objectForKey("lt.danie.hacks.boop.tokens.user")
  end
end



class APIManager
  def client
    @client = AFMotion::SessionClient.build("https://boop.ngrok.com") do
      session_configuration :default

      header "Accept", "application/json"

      response_serializer :json
    end
  end

  def create_group(device_uuid, group_uuid, push_token="no push for u.")
    client.post("/api/v1/devices", device: {group_id: group_uuid, id: device_uuid, token: push_token, type: "OsxDevice"}) do |result|
      p result
    end
  end
end



class QRManager
  def self.create(content, size)
    QRGen.quickResponseImageForString(content, withDimension: size)
  end
end
