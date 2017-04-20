# frozen_string_literal: true

shared_examples_for 'embargo_release' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has embargo_release' do
    expect(stubby.embargo_release).to eq(2016 - 12 - 12)
  end
  it 'has embargo_release predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/spar/fabio/hasEmbargoDate')))
  end
end
