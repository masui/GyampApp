# -*- coding: utf-8 -*-
# StatusView.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/28.
# Copyright 2011 Pitecan Systems. All rights reserved.

class StatusView < NSView
  attr_accessor :app
  attr_accessor :statusBarTitle

  def initWithFrame(rect)
    # http://d.hatena.ne.jp/swallow_life/20090614
    super # [super initWithFrame(rect)] のかわりらしい
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
    @statusBarTitle.setTextColor(@app.visible ? NSColor.whiteColor : NSColor.blackColor)
    @app.statusItem.drawStatusBarBackgroundInRect(self.bounds,withHighlight:@app.visible)
  end
end
