require 'chef/mixin/shell_out'
include Chef::Mixin::ShellOut

describe "exim4-light" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it "creates the mailname file" do
    file("/etc/mailname").must_exist
  end

  it "creates the passwd.client file" do
    file("/etc/exim4/passwd.client").must_exist
  end

  it "creates the update-exim4.conf.conf file" do
    file("/etc/exim4/update-exim4.conf.conf").must_exist
  end

end
