//// Functions to colorize text in the terminal with ANSI escape codes.

/// Red text color
pub fn red(text: String) -> String {
  "\u{001b}[38;5;1m" <> text <> "\u{001b}[0m"
}

/// Yellow text color
pub fn yellow(text: String) -> String {
  "\u{001b}[38;5;3m" <> text <> "\u{001b}[0m"
}

/// Magenta text color
pub fn magenta(text: String) -> String {
  "\u{001b}[38;5;5m" <> text <> "\u{001b}[0m"
}

/// Cyan text color
pub fn cyan(text: String) -> String {
  "\u{001b}[38;5;6m" <> text <> "\u{001b}[0m"
}

/// White text color
pub fn white(text: String) -> String {
  "\u{001b}[38;5;7m" <> text <> "\u{001b}[0m"
}

/// Green text color
pub fn green(text: String) -> String {
  "\u{001b}[38;5;2m" <> text <> "\u{001b}[0m"
}

/// Blue text color
pub fn blue(text: String) -> String {
  "\u{001b}[38;5;4m" <> text <> "\u{001b}[0m"
}
