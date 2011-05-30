# -*- coding: utf-8 -*-
# Gyamp.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/28.
# Copyright 2011 Pitecan Systems. All rights reserved.

# IBでこのクラスをFile's Ownerのdelegateに指定しておく

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
    # open GyampApp.app --args masui のように起動
    @gyampUser = 'now'
    @gyampUser = ARGV[0] if ARGV[0]
    @gyampTitle = 'Gyamp!'
    @gyampTitle = ARGV[1] if ARGV[1]
    @statusBarTitle.setStringValue(@gyampTitle)

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

  def query(sender)
    if @visible then
      url = "http://#{@gyampUser}.3memo.com/"+sender.stringValue
      system "open #{url}"
      hideQueryView
      @statusView.setNeedsDisplay(true) # Highlightを中止
    end
  end
end
