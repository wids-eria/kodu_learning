require 'spec_helper'

describe Comment do
  it { should belong_to :author }
  it { should belong_to :level }
end
