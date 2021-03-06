require 'spec_helper'

describe Insightly2::Resources::Opportunity do
  subject(:opportunity) do
    VCR.use_cassette('get_opportunity') do
      Insightly2.client.get_opportunity(id: 4070112)
    end
  end

  describe 'instance' do
    it 'is decorated with Opportunity object' do
      expect(subject).to be_a(described_class)
    end

    %w(opportunity_id opportunity_name opportunity_details probability bid_currency bid_amount
       bid_type bid_duration forecast_close_date category_id pipeline_id stage_id opportunity_state
       image_url responsible_user_id owner_user_id date_created_utc date_updated_utc visible_to
       visible_team_id visible_user_ids customfields tags links emaillinks).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
