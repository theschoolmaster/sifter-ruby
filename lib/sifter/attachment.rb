# Wrapper around an attachment
# https://sifterapp.com/developer/resources/issues#detail
class Sifter::Attachment < Hashie::Dash
  #"attachments": [
  #  {
  #    "filename": "1.png",
  #    "size": 16895,
  #    "height": 294,
  #    "width": 320,
  #    "url": "http://example.sifterapp.com/attachments/1",
  #    "thumb_url": "https://example.s3.amazonaws.com/attachments/1/1_thumb.png?AWSAccessKeyId=123456&Signature=123456&Expires=1351808613"
  #  }

  property :filename
  property :size
  property :height
  property :width
  property :url
  property :thumb_url

end
