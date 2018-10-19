class Resume < ApplicationRecord
  belongs_to :user
  serialize :data

  DEFAULT_DATA_TEMPLATE = {
    "basics": {
      "name": "",
      "label": "",
      "picture": "",
      "email": "",
      "phone": "",
      "website": "",
      "summary": "",
      "location": {
        "address": "",
        "postalCode": "",
        "city": "",
        "countryCode": "",
        "region": ""
      },
      "profiles": []
    },
    "work": [],
    "volunteer": [],
    "education": [],
    "awards": [],
    "publications": [],
    "skills": [],
    "languages": [],
    "interests": [],
    "references": []
  }

  PROFILES_TEMPLATE = {
    "network": "",
    "username": "",
    "url": ""
  }

  WORK_TEMPLATE = {
    "company": "",
    "position": "",
    "website": "",
    "startDate": "",
    "endDate": "",
    "summary": "",
    "highlights": []
  }

  VOLUNTEER_TEMPLATE = {
    "organization": "",
    "position": "",
    "website": "",
    "startDate": "",
    "endDate": "",
    "summary": "",
    "highlights": []
  }

  EDUCATION_TEMPLATE = {
    "institution": "",
    "area": "",
    "studyType": "",
    "startDate": "",
    "endDate": "",
    "gpa": "",
    "courses": []
  }

  AWARDS_TEMPLATE = {
    "title": "",
    "date": "",
    "awarder": "",
    "summary": ""
  }

  PUBLICATIONS_TEMPLATE = {
    "name": "",
    "publisher": "",
    "releaseDate": "",
    "website": "",
    "summary": ""
  }

  SKILLS_TEMPLATE = {
    "name": "",
    "level": "",
    "keywords": []
  }

  LANGUAGES_TEMPLATE = {
    "language": "",
    "fluency": ""
  }

  INTERESTS_TEMPLATE = {
    "name": "",
    "keywords": []
  }

  REFERENCES_TEMPLATE = {
    "name": "",
    "reference": ""
  }

  belongs_to :user
end
