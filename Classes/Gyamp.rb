# -*- coding: utf-8 -*-
# Gyamp.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/28.
# Copyright 2011 Pitecan Systems. All rights reserved.

# IBでこのクラスをFile's Ownerのdelegateに指定しておく

require 'net/http'

class Gyamp
  attr_accessor :statusView
  attr_accessor :statusBarTitle
  attr_accessor :queryView
  attr_accessor :queryWindow
  attr_reader :statusItem
  attr_reader :visible

  def initialize
  end

  # IBデータを読み込んだ後で呼ばれる
  def awakeFromNib
    # open GyampApp.app --args Delta mlab masui のように起動
    @gyampTitle = 'Gyamp!'
    @gyampTitle = ARGV.shift if ARGV[0]
    @gyampAccounts = ['now']
    @gyampAccounts = ARGV.dup if ARGV.length > 0
    @statusBarTitle.setStringValue(@gyampTitle)

    #
    # ステータスバーの設定
    #
    systemStatusBar = NSStatusBar.systemStatusBar
    @statusItem = systemStatusBar.statusItemWithLength(NSVariableStatusItemLength)
    # @statusItem = systemStatusBar.statusItemWithLength(@statusBarTitle.frame.size.width)
    @statusItem.setHighlightMode(true)

    # @statusItem.setTitle("Gyamp!!")
    # @statusItem.setImage(image)
    @statusItem.setView(@statusView)

    @statusItem.setHighlightMode(true)

    # @statusItem.setEnabled(true)

    @statusItem.setMenu(@menu)

    statusViewPosy = @statusView.window.frame.origin.y
    statusViewPosx = @statusView.window.frame.origin.x

    #
    # キーワード入力ウィンドウを作成
    #
    rect = NSZeroRect
    rect.size = @queryView.frame.size;
    mask = @queryWindow.styleMask
    #
    # enum {
    #    NSBorderlessWindowMask = 0,
    #    NSTitledWindowMask = 1 << 0,
    #    NSClosableWindowMask = 1 << 1,
    #    NSMiniaturizableWindowMask = 1 << 2,
    #    NSResizableWindowMask = 1 << 3,
    #    NSTexturedBackgroundWindowMask = 1 << 8
    # };
    mask = 0b0000
    @queryWindow.initWithContentRect(rect,
                                     styleMask:mask,
                                     backing:NSBackingStoreBuffered,
                                     defer:false)
    # @queryWindow.makeKeyWindow
    @queryWindow.contentView.addSubview(@queryview)
#    @querywindow.setBackgroundColor(NSColor.clearColor)
    @queryWindow.setMovableByWindowBackground(false)
    @queryWindow.setExcludedFromWindowsMenu(true)
    @queryWindow.setAlphaValue(1.0)
    @queryWindow.setOpaque(false)
    # @queryWindow.setHasShadow(false)
    @queryWindow.useOptimizedDrawing(true)
    y = statusViewPosy - @queryWindow.frame.size.height
    x = statusViewPosx
    @queryWindow.setFrameOrigin(NSPoint.new(x,y))

    hideQueryView

#    @@xxx = @statusItem # for preventing GC

  end

  def showQueryView
    @visible = true
    @queryWindow.contentView.addSubview(@queryView)
    @queryWindow.setHasShadow(true)
    @queryWindow.orderFrontRegardless
  end

  def hideQueryView
    @visible = false
    @queryView.removeFromSuperview
    @queryWindow.setHasShadow(false)
    @queryWindow.orderOut(self) # Windowを隠す
  end

  def dest(keyword,accounts)
    res = nil
    accounts.each { |account|
      Net::HTTP.start('gyamp.com', 80) {|http|
        response = http.get("/#{account}/#{keyword}")
        location = response['location']
        res = location unless location =~ /google/
      }
      break if res
    }
    return res
  end

  def execute(sender)
    if @visible then
      keyword = sender.stringValue
      if keyword =~ /!$/ then
        url = "http://gyamp.com/#{@gyampAccounts[0]}/#{keyword}"
      else
        url = dest(keyword,@gyampAccounts)
        url = "http://google.co.jp/search?q=#{keyword}" unless url
      end
      system "open #{url}"
      hideQueryView
      @statusView.setNeedsDisplay(true) # Highlightを中止
    end
  end
end
