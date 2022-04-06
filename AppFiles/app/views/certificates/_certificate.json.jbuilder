json.extract! certificate, :id, :CertificateId, :Name, :Grade, :Description, :created_at, :updated_at
json.url certificate_url(certificate, format: :json)
