# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe '.calculate_inss_discount' do
    context 'when the salary is inside first level 7.5%' do
      it 'calculates when salary is 1400' do
        expect(Proponent.calculate_inss_discount(1400)).to eq(105.0)
      end
    end

    context 'when the salary is inside second level 9%' do
      it 'calculates when salary is 1400' do
        expect(Proponent.calculate_inss_discount(1400)).to eq(105.0)
      end
    end

    context 'when the salary is inside third level 12%' do
      it 'calculates when salary is 3000' do
        expect(Proponent.calculate_inss_discount(3_000)).to eq(258.82)
      end
      it 'calculates when salary is 4000' do
        expect(Proponent.calculate_inss_discount(4_000)).to eq(378.82)
      end
    end

    context 'when the salary is inside fourth level 14%' do
      it 'calculates when salary is 4500' do
        expect(Proponent.calculate_inss_discount(4_500)).to eq(448.82)
      end

      it 'calculates when salary is 7500' do
        expect(Proponent.calculate_inss_discount(7_500)).to eq(868.82)
      end

      it 'calculates when salary is 9000' do
        expect(Proponent.calculate_inss_discount(9_000)).to eq(908.86)
      end

      it 'calculates when salary is 20000' do
        expect(Proponent.calculate_inss_discount(20_000)).to eq(908.86)
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
