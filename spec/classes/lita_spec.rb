require 'spec_helper'
hiera_file = 'spec/fixtures/hiera/hiera.yaml'

describe 'lita', :type => :class  do

    context 'without hiera data' do
        it { should contain_class('lita') }
    end

    context 'with explicit data' do
        let(:params) {{
            :adapter => 'xmpp'
        }}
        it { should contain_class('lita').with_adapter('xmpp') }
    end

#    context 'with explicit hiera lookup' do
#        let (:hiera_config) { hiera_file }
#
#        hiera = Hiera.new(:config => hiera_file)
#        variable = hiera.lookup('lita::adapter', nil, nil)
#        let (:params) {{
#            :myparam => variable
#        }}
#        it { should contain_class('lita').with_myparam(variable) }
#    end
end
