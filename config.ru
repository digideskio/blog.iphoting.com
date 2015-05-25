#!/usr/bin/env rakeup
#\ -E deployment

require 'rack/embed'
require 'vienna'

use Rack::Embed, :max_size => 3072

run Vienna::Application.new('_site')
