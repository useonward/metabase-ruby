# frozen_string_literal: true
require "spec_helper"

RSpec.describe Metabase::Endpoint::Public do
  include_context 'client'
  let(:card_uuid) { '708a78ec-15c8-405e-b590-de98c6ddfa01' }

  describe 'public_card', vcr: true do
    context 'success' do
      it 'returns the public card' do
        public_card = client.public_card(card_uuid)
        expect(public_card).to be_kind_of(Hash)
      end
    end
  end

  describe 'query_public_card_with_metadata', vcr: true do
    context 'success' do
      it 'returns query results of the public card with metadata' do
        result = client.query_public_card_with_metadata(card_uuid)
        expect(result).to be_kind_of(Hash)
      end
    end
  end

  describe 'query_public_card', vcr: true do
    context 'success' do
      it 'returns query results of the public card' do
        result = client.query_public_card(card_uuid)
        expect(result).to be_kind_of(Array)
      end
    end

    context 'specify format' do
      it 'returns query results of the public card as specified format' do
        result = client.query_public_card(card_uuid, format: :csv)
        expect(result).to be_kind_of(String)
      end
    end
  end
end
