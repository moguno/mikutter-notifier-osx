#coding: UTF-8

Plugin.create(:"mikutter-notifier-osx") {
  require "rubygems"
  require "terminal-notifier"

  defsound(:osx, "Mac OS X") { |filename|
    if FileTest.exist?(filename)
      bg_system("afplay", filename) 
    end
  }

  on_popup_notify { |user, text|
    Thread.new {
      TerminalNotifier::notify(text,
        :appIcon => Skin.get("icon.png"),
        :contentImage => user[:profile_image_url],
        :title => "mikutter",
        :group => user[:screen_name],
        :sender => user[:screen_name],
        :subtitle => "#{user[:name]}(@#{user[:screen_name]})"
      )
    }
  }
}
