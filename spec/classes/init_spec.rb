require 'spec_helper'
describe 'dockerup' do

  context 'with defaults for all parameters' do
    it { should contain_class('dockerup') }
  end
end
