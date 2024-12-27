require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe '.calculate_inss_discount' do
    context 'when the salary is inside first level 7.5%' do
      it 'calculates when salary is 1400' do
        result = Proponent.calculate_inss_discount(1400)

        expect(result).to eq(105.0)
      end
    end

    context 'when the salary is inside second level 9%' do
      it 'calculates when salary is 1400' do
        result = Proponent.calculate_inss_discount(1400)

        expect(result).to eq(105.0)
      end
    end

    context 'when the salary is inside third level 12%' do
      it 'calculates when salary is 1400' do
        result = Proponent.calculate_inss_discount(1400)

        expect(result).to eq(105.0)
      end
    end

    context 'when the salary is inside fourth level 14%' do
      it 'calculates when salary is 1400' do
        result = Proponent.calculate_inss_discount(1400)

        expect(result).to eq(105.0)
      end
    end

    context 'when the salary is zero or negative' do
      it 'returns zero discount' do
        salary = 0.0

        result = Proponent.calculate_inss_discount(salary)

        expect(result).to eq(0.0)
      end
    end
  end
end
