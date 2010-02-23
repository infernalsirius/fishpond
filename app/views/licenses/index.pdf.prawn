licenses = @licenses.each do |lic|
  [lic.software.to_s]
end

pdf.table licenses