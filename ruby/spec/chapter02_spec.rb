require 'spec_helper'
require './chapter02'

describe 'Chapter02' do
  let(:client) { Redis.new(db: 15) }
  
  before do
    client.flushdb
  end
  
end