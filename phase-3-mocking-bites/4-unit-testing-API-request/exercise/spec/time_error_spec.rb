require "time_error"

RSpec.describe TimeError do
  it "returns the difference between the remote clock and the local one" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return( ' {"abbreviation":"CET","client_ip":"188.217.58.53","datetime":"2022-12-29T20:14:29.932828+01:00","day_of_week":4,"day_of_year":363,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":3600,"timezone":"Europe/Rome","unixtime":1672341269,"utc_datetime":"2022-12-29T19:14:29.932828+00:00","utc_offset":"+01:00","week_number":52} ' )
    time = Time.new(2022, 12, 29, 20, 14, 29)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.932828
  end
end