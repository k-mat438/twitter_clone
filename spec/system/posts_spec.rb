# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  # pending "add some scenarios (or delete) #{__FILE__}"

  describe 'Create new post' do
    context 'when Successe' do
      it 'Save new post' do
      end
    end

    context 'when Failed' do
      it 'Not save it' do
      end
    end
  end
end
