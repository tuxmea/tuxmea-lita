require 'spec_helper'

nodoublequotes = Proc.new do |x|
  not x =~ /"/
end

describe 'lita::handler' do
  context 'jenkins and shell' do
      let(:title) { 'jenkins' }
      let(:pre_condition) {
          "class { lita: handler_config => { jenkins => { 'url' => 'localhost' } }, adapter => 'shell' }"
      }
      let(:facts) { {
          :concat_basedir         => '/dne'
      } }

      it { should contain_package('lita-jenkins') }
      it { should contain_lita__handler('jenkins') }
      it { should contain_concat__fragment('Gemfile_lita_jenkins') }
      it { should contain_concat__fragment('config_lita_jenkins') }
      it { should have_concat__fragment_resource_count(6) }
  end
  context 'jenkins and xmpp' do
      let(:title) { 'jenkins' }
      let(:pre_condition) {
          "class { lita: handler_config => { jenkins => { 'url' => 'localhost' } }, adapter => 'xmpp', adapter_config => { xmpp => { 'jid' => 'foo'} } }"
      }
      let(:facts) { {
          :concat_basedir         => '/dne'
      } }

      it { should have_concat__fragment_resource_count(7) }
  end
end
