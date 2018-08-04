require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'constants' do
    describe 'roles' do
      it 'has the admin role' do
        expect(User::ROLES).to eq([:admin])
      end
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
  end

  describe '#tester?' do
    ['example.com', 'headway.io'].each do |domain|
      it "an email including the #{domain} domain is a tester" do
        user = build(:user, email: "asdf@#{domain}")
        expect(user.tester?).to eq(true)
      end
    end

    it 'an email including the gmail.com domain is NOT a tester' do
      user = build(:user, email: 'asdf@gmail.com')
      expect(user.tester?).to eq(false)
    end
  end

  describe '#send_push_notification' do
    let(:user) { create(:user, device_token: '1234') }
    let(:rpush) { class_double('Rpush::Apns::App') }
    # let(:rpush) { double('Rpush::Apns::App') }
    let(:notification) { class_double('Rpush::Apns::Notification') }

    subject(:push_notification) do
      user.send_push_notification('Test notification', 'test app')
    end

    it 'returns early' do
      allow(Rpush::Apns::App).to receive(:find_by).and_return(nil)

      expect(push_notification).to be_nil
    end

    it 'creates a new notification' do
      expect(Rpush::Apns::App).to receive(:find_by).and_return(rpush)
      expect(Rpush::Apns::Notification).to receive(:new)
        .and_return(notification)
      expect(notification).to receive(:app=).with(rpush)
      expect(notification).to receive(:device_token=).with(user.device_token)
      expect(notification).to receive(:alert=).with('Test notification')
      expect(notification).to receive(:data=).with(type: 'test app')
      expect(notification).to receive(:save!)

      push_notification
    end
  end

  describe 'new user creation' do
    it 'ensures uniqueness of the uuid' do
      allow(User).to receive(:exists?).and_return(true, false)

      expect do
        create(:user)
      end.to change(User, :count).by(1)

      expect(User).to have_received(:exists?).exactly(2).times
    end
  end

  describe 'address fields' do
    let(:user) { create(:user) }
    let!(:address) do
      create(:address,
             line1: '123 fake st',
             line2: nil,
             city: 'Denver',
             state: 'CO',
             zip: '80219',
             addressable: user)
    end

    subject(:user_display_address) { user.display_address }

    it 'returns a display address' do
      expect(user_display_address).to eq('123 fake st<br>Denver, CO 80219')
    end
  end
end

# rubocop:disable Metrics/LineLength, Lint/UnneededCopDisableDirective
# == Schema Information
#
# Table name: users
#
#  birthdate              :date
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  deleted_at             :datetime
#  device_token           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :bigint(8)        not null, primary key
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_id          :bigint(8)
#  invited_by_type        :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  photo_data             :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  roles_mask             :integer
#  sign_in_count          :integer          default(0), not null
#  updated_at             :datetime         not null
#  uuid                   :string
#
# Indexes
#
#  index_users_on_deleted_at                         (deleted_at)
#  index_users_on_email                              (email) UNIQUE
#  index_users_on_invitation_token                   (invitation_token) UNIQUE
#  index_users_on_invitations_count                  (invitations_count)
#  index_users_on_invited_by_id                      (invited_by_id)
#  index_users_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_users_on_reset_password_token               (reset_password_token) UNIQUE
#
# rubocop:enable Metrics/LineLength, Lint/UnneededCopDisableDirective
