require 'greed'

describe Greed, "score_of" do
  let(:greed) { Greed.new }

  it "should return 100 when rolling one 1" do
    greed.score_of(1).should == 100
  end

  it "should return 50 when rolling one 5" do
    greed.score_of(5).should == 50
  end

  it "should return 0 when rolling any non 1 or 5" do
    greed.score_of(2).should == 0
    greed.score_of(3).should == 0
    greed.score_of(4).should == 0
    greed.score_of(6).should == 0
  end

  it "should return 200 when rolling two 1s" do
    greed.score_of(1,1).should == 200
  end

  it "should return 100 when rolling two 5s" do
    greed.score_of(5,5).should == 100
  end

  it "should return 0 when rolling two non 1 or 5s" do
    greed.score_of(2,2).should == 0
    greed.score_of(3,3).should == 0
    greed.score_of(4,4).should == 0
    greed.score_of(6,6).should == 0
  end

  it "should return 1000 when rolling three 1s" do
    greed.score_of(1,1,1).should == 1000
  end

  it "should return 500 when rolling three 5s" do
    greed.score_of(5,5,5).should == 500
  end

  it "should return 100 times die value when rolling three non 1 or 5s" do
    greed.score_of(2,2,2).should == 200
    greed.score_of(3,3,3).should == 300
    greed.score_of(4,4,4).should == 400
    greed.score_of(6,6,6).should == 600
  end

  it "should handle combinations of sets and extra 1s and/or 5s" do
    greed.score_of(1,3,5,1,1).should == 1050
    greed.score_of(5,3,5,5,5).should == 550
  end
end
