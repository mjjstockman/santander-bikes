require 'van'

describe 'Vans' do
  # let(:bike) { double('bike') }

  it 'collects broken bikes' do
    van = Van.new
    expect { van.collect(:bike) }.not_to raise_error
  end
end
