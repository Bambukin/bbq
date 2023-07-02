require 'rails_helper'
require 'pundit/rspec'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.new }

  subject { EventPolicy }
  context 'when user is anon' do
    permissions :create?, :new? do
      it { is_expected.not_to permit(nil, Event) }
    end
  end

  context 'when user is not an owner' do
    let(:event) { Event.new }

    permissions :create?, :new? do
      it { is_expected.to permit(user, Event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'when user is an owner' do
    let(:event) { Event.create(user:) }

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
