# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::LabelValidator do
  let(:authority) { DogBiscuits::Concept.new }
  let(:collection) { DogBiscuits::Collection.new }
  let(:work) { DogBiscuits::Dataset.new }
  let(:person) { DogBiscuits::Person.new }
  let(:organisation)  { DogBiscuits::Organisation.new }

  skip 'saves without a title' do
    expect(work.save).to be_falsey
  end

  skip 'does not save without a title' do
    expect(collection.save).to be_falsey
  end

  skip 'does not save without a preflabel' do
    expect(authority.save).to be_falsey
  end

  skip 'does not save without a preflabel or name part' do
    expect(person.save).to be_falsey
  end

  skip 'saves without a preflabel or name' do
    expect(organisation.save).to be_falsey
  end
end