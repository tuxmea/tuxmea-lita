require 'spec_helper'
hiera_file = 'spec/fixtures/hiera/hiera.yaml'

describe 'lita', :type => :class  do
    let(:facts) { {
        :concat_basedir         => '/dne'
    } }

    context 'with default values' do
        it { should contain_class('lita') }
    end

    context 'with explicit data' do
        let(:params) {{
            :adapter => 'xmpp'
        }}
        it { should contain_class('lita').with_adapter('xmpp') }
        it { should contain_file('/etc/init.d/lita').with_content(/xmpp/) }
        it { should contain_service('lita') }
    end

end
