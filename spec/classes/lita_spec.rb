require 'spec_helper'
hiera_file = 'spec/fixtures/hiera/hiera.yaml'

describe 'lita', :type => :class  do
    let(:facts) { {
        :concat_basedir         => '/dne'
    } }

    context 'with default values' do
        let(:params) {{
            :adapter => 'shell'
        }}
        it { should contain_class('stdlib') }
        it { should contain_class('stdlib::stages') }
        it { should contain_stage('setup') }
        it { should contain_class('concat::setup') }
        it { should contain_class('lita') }
        it { should contain_class('lita::setup') }
        it { should contain_class('lita::new') }
        it { should contain_class('lita::params') }
        it { should contain_class('lita::config') }
        it { should contain_class('lita::install') }
        it { should contain_class('lita::service') }
        it { should contain_class('lita::adapter') }
        it { should contain_class('lita::validate_adapter') }
        it { should contain_file('/etc/lita') }
        it { should contain_file('/etc/lita/lita') }
        it { should contain_file('/etc/lita/lita/Gemfile') }
        it { should contain_file('/etc/lita/lita/lita_config.rb') }
        it { should contain_package('ruby') }
        it { should contain_package('gem') }
        it { should contain_package('lita').with_provider('gem') }
        it { should contain_concat('/etc/lita/lita/Gemfile') }
        it { should contain_concat('/etc/lita/lita/lita_config.rb') }
        it { should contain_concat__fragment('Gemfile_lita_header') }
        it { should contain_concat__fragment('config_lita_header') }
        it { should contain_concat__fragment('config_lita_adapter') }
        it { should contain_concat__fragment('config_lita_footer') }
    end

    context 'with explicit data' do
        let(:params) {{
            :adapter => 'xmpp',
            :adapter_config => { 'xmpp' => { 'jid' => 'lita' } }
        }}
        it { should contain_package('lita-xmpp').with_provider('gem') }
        it { should contain_class('lita').with_adapter('xmpp') }
        it { should contain_concat__fragment('Gemfile_lita_adapter') }
        it { should contain_file('/etc/init.d/lita').with_content(/xmpp/) }
        it { should contain_service('lita') }
    end

    context 'with explicit lita_name' do
        let(:params) {{
            :lita_name => 'foo',
            :adapter => 'shell'
        }}
        it { should contain_file('/etc/lita/foo/Gemfile') }
        it { should contain_file('/etc/lita/foo/lita_config.rb') }
    end

end
