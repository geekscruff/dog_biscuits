# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Terms::PeopleTerms do
  let(:terms) { described_class.new }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:person) { FactoryBot.create(:person) }
  let(:people) { FactoryBot.create(:people) }

  it 'has one term' do
    people.people << person
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    people.people << person
    terms.all.should eq([{ id: person.id.to_s, label: "Spaceman David Bowie PhD, 1947-2016" }])
  end

  it 'does not find the term by id' do
    people.people << person
    terms.find('not-a-real-id').should eq([])
  end

  # intermittently fails
  skip 'finds the term by id' do
    people.people << person
    terms.find(person.id).first[:label].should eq('Spaceman David Bowie PhD, 1947-2016')
  end

  it 'returns one result' do
    people.people << person
    terms.search('Bowie').length.should eq(1)
  end

  it 'returns no results' do
    people.people << person
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    people.people << person
    terms.find_id('Spaceman David Bowie PhD, 1947-2016').should match(/[[:alnum:]]{9,}/)
  end

  it 'finds the label by the id' do
    people.people << person
    terms.find_label_string(person.id).should eq(['Spaceman David Bowie PhD, 1947-2016'])
  end

  it 'returns all for options list' do
    people.people << person
    terms.select_all_options.should match([["Spaceman David Bowie PhD, 1947-2016", /[[:alnum:]]{9,}/]])
  end
end
