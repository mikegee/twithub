require "spec_helper"

describe "StatusHelper" do
  let(:mentioned_user) { create(:user) }
  let(:mentioned_user_2) { create(:user) }
  let(:message) { "hey @#{mentioned_user.username}" }
  let(:mentioned_username) { "@#{mentioned_user.username}" }

  it "linkifies user names" do
    expect(helper.link_mentions(message)).to match(/href="#{helper.user_path(mentioned_user)}"/)
  end

  it "doesn't link mentions to non-users" do
    expect(helper.link_mentions("@notauser")).to eq("@notauser")
  end

  it "should link if the mention is in parens" do
    msg = helper.link_mentions("(#{mentioned_username})")
    expect(msg).to match(/\A\(.*\)\z/)
    expect(msg).to match(/href="#{helper.user_path(mentioned_user)}"/)
  end

  it "should not make a link if preceded by a word char" do
    # looks like an email
    expect(helper.link_mentions("x#{mentioned_username}")).to eq("x#{mentioned_username}")
  end

  it "should link more than one mention if present" do
    msg = helper.link_mentions("#{mentioned_username} said @#{mentioned_user_2.username}")
    expect(msg).to match(/href="#{helper.user_path(mentioned_user)}"/)
    expect(msg).to match(/href="#{helper.user_path(mentioned_user_2)}"/)
  end
end
