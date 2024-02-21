# frozen_string_literal: true
require "spec_helper"

RSpec.describe Metabase::Endpoint::User do
  include_context 'login'

  describe 'users', vcr: true do
    context 'success' do
      it 'returns all users' do
        users = client.users
        expect(users).to be_kind_of(Array)
      end
    end
  end

  describe 'current_user', vcr: true do
    context 'success' do
      it 'returns the current user' do
        user = client.current_user
        expect(user).to be_kind_of(Hash)
      end
    end
  end
end
