//// Functions to style text in the terminal

pub fn bold(text: String) -> String {
  "\u{001b}[1m" <> text <> "\u{001b}[0m"
}

pub fn underline(text: String) -> String {
  "\u{001b}[4m" <> text <> "\u{001b}[0m"
}

pub fn reversed(text: String) -> String {
  "\u{001b}[7m" <> text <> "\u{001b}[0m"
}

pub fn dim(text: String) -> String {
  "\u{001b}[2m" <> text <> "\u{001b}[0m"
}

pub fn italic(text: String) -> String {
  "\u{001b}[3m" <> text <> "\u{001b}[0m"
}
