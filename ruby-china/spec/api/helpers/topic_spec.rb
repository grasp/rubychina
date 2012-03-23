require 'spec_helper'

describe RubyChina::APIHelpers do
  before { extend RubyChina::APIHelpers }

  it "should use size that is valid" do
    stub_params(:size => 10)
    page_size.should == 10
  end

  it "should use max size if page size provided greater than that" do
    stub_params(:size => max_page_size + 1)
    page_size.should == max_page_size
  end

  it "should use default size if page size provided is not valid" do
    stub_params(:size => 'a')
    page_size.should == default_page_size
  end

  private
  def stub_params(p = {})
    self.stub!(:params).and_return(p)
  end
end
