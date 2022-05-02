import { screen, render } from "@testing-library/react";

import App from "../App";

describe("Main App Tests", () => {
  it("Renders header", () => {
    render(<App />);
    expect(screen.getByTestId(/header/i)).toBeInTheDocument();
  });

  it("Renders Center text", () => {
    render(<App />);
    expect(screen.getByTestId(/center-text/i)).toBeInTheDocument();
  });

  it("Renders Footer", () => {
    render(<App />);
    expect(screen.getByTestId(/footer/i)).toBeInTheDocument();
  });
});
