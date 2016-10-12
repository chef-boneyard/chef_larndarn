# encoding: utf-8
# copyright: 2015, Chef Software, Inc
# license: All rights reserved

title 'Summit environment tests'

control 'summit-1' do
  impact 1.0
  title 'Port 80 should be listening'
  describe port(80) do
    it { should be_listening }
  end
end

control 'summit-2' do
  impact 1.0
  title 'Habitat supervisor API endpoint port should be listening'
  describe port(9631) do
    it { should be_listening }
  end
end

control 'summit-3' do
  impact 1.0
  title 'Application front end should be reachable'
  describe host('http://voteforit-348106303.eu-west-1.elb.amazonaws.com', port: 80, proto: 'tcp') do
    it { should be_reachable }
  end
end

control 'summit-4' do
  impact 0.5
  title 'Telnet should not be installed'
  describe package('telnet') do
    it { should_not be_installed }
  end
end
