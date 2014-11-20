require 'spec_helper'

nodoublequotes = Proc.new do |x|
  not x =~ /"/
end

describe 'lita::handler' do
  context 'single usage' do
      let(:title) { 'jenkins' }
      let(:pre_condition) {
          "class { lita: handler_config => { jenkins => { 'url' => 'localhost' } } }"
      }
      let(:facts) { {
          :concat_basedir         => '/dne'
      } }

      it { should contain_package('lita-jenkins') }
      it { should have_concat__fragment_resource_count(6) }
  end
end
