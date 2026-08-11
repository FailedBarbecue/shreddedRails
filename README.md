# ShreddedRails

ShreddedRails is a simple workout tracking application built with Ruby on Rails 8. It helps users organize exercises by workout day, add details such as muscle group, equipment, difficulty, and video links, and mark exercises as completed for the current day.

## Features

- Browse workout days from Monday to Sunday
- Add new exercises with metadata
- Track exercise completion dynamically
- Use Hotwire/Turbo for a smooth and responsive experience
- Styled with Tailwind CSS

## Tech Stack

- Ruby 3.4.9
- Rails 8.1.3
- SQLite
- Tailwind CSS
- Hotwire (Turbo + Stimulus)

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Ruby 3.4.9
- Bundler
- SQLite3

### Installation

```bash
git clone git@github.com:FailedBarbecue/shreddedRails.git
cd shreddedrails
bundle install
bin/rails db:prepare
```

### Run the app

```bash
bin/rails server
```

Then open http://localhost:3000 in your browser.

## Usage

- Open the home page to view the selected workout day
- Create new exercises from the “New Exercise” button
- Mark exercises as completed for the current day
- Navigate between days using the previous/next controls

## Testing

Run the test suite with:

```bash
bin/rails test
```

## Notes

This project is currently focused on the core workout-tracking experience. Seed data is not included yet, so you can create your own exercises and workout days through the interface.
