# -*- coding: utf-8 -*-
# StatusView.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/28.
# Copyright 2011 Pitecan Systems. All rights reserved.

#
# StatusBarのViewでちゃんとメニューを出すためにはこういう細工が必要
# http://undefinedvalue.com/2009/07/07/adding-custom-view-nsstatusitem

# A view in a menu item can receive all mouse events as normal, but keyboard events are not supported. 
# http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/MenuList/Articles/ViewsInMenuItems.html

class StatusView < NSView
  attr_accessor :app

  def initWithFrame(rect)
    # http://d.hatena.ne.jp/swallow_life/20090614
    if super then # [super initWithFrame(rect)] のかわりらしい
#      @visible = false
    end
    self
  end

  def mouseDown(event)
    if @app.visible then
      @app.hideQueryView
    else
      @app.showQueryView
    end
    self.setNeedsDisplay(true)
  end

  def rightMouseDown(event)
    puts "RightMouseDown"
  end

  def drawRect(rect)
    @app.statusItem.drawStatusBarBackgroundInRect(self.bounds,withHighlight:@app.visible)
  end
end
