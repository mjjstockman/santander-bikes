require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe '#working?' do
    context 'on initialization' do
      it '#working? returns true' do
        expect(subject).to be_working
      end
    end

    context '#report_broken' do
      it '#working? returns false' do
        bike.report_broken

        expect(bike.working?).to eq false
      end
    end
  end
end
