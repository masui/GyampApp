# -*- coding: utf-8 -*-
# QueryWindow.rb
# GyampApp
#
# Created by Toshiyuki Masui on 11/05/29.
# Copyright 2011 Pitecan Systems. All rights reserved.

class QueryWindow < NSWindow
  #
  # NSWindowのサブクラスでこのメソッドを実装しないとタイトルなしの
  # ウィンドウはキー入力を受け取れないらしい!
  # http://stackoverflow.com/questions/4946342/why-nswindow-without-stylemasknstitledwindowmask-can-not-be-keywindow
  # http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSWindow_Class/Reference/Reference.html#//apple_ref/occ/instm/NSWindow/canBecomeKeyWindow
  #
  def canBecomeKeyWindow
    return true
  end
end
