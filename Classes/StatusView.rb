# -*- coding: utf-8 -*-
# StatusView.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/28.
# Copyright 2011 Pitecan Systems. All rights reserved.

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
