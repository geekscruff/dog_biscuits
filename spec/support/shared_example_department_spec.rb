shared_examples_for 'department' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @org = FactoryGirl.build_stubbed(:organisation)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.department_resource << @org
  end
  # metadata
  it 'has department' do
    expect(@stubby.department_resource.first).to eq(@org)
  end

  it 'has department predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('department_value_tesim')))
    expect(@stubby.to_solr.should(include('department_value_sim')))
  end
end
