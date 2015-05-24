#!/usr/bin/env rakeup
#\ -E deployment

require 'vienna'

run Vienna::Application.new('_site')
