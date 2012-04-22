require 'spec_helper'

describe Blimpy::Engine do

  describe '#load_file' do
    context 'no contents' do
      let(:content) { '' }

      it 'should raise InvalidBlimpFileError' do
        expect {
          subject.load_file(content)
        }.to raise_error(Blimpy::InvalidBlimpFileError)
      end

    end

    context 'invalid content' do
      let(:content) do
        """
          this is totally invalid Ruby
        """
      end

      it 'should raise InvalidBlimpFileError' do
        expect {
          subject.load_file(content)
        }.to raise_error(Blimpy::InvalidBlimpFileError)
      end
    end

    context 'valid content' do
      let(:content) do
        """
          Blimpy.fleet do |fleet|
            fleet.add do |host|
              host.image_id = 'ami-349b495d'
              host.livery = 'rails'
              host.group = 'Simple'
              host.region = :uswest1
              host.name = 'Rails App Server'
            end
          end
        """
      end

      it 'should create the appropriate Fleet object' do
        pending 'Requires Blimpy#fleet to work'
      end
    end
  end
end
