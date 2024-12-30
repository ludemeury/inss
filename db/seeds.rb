# frozen_string_literal: true
admin_user = "admin@admin.com"
User.create!(email_address: admin_user, password: "123456", password_confirmation: "123456") unless User.where(email_address: admin_user).any?

FactoryBot.create_list(:proponent, 15) unless Proponent.any?
