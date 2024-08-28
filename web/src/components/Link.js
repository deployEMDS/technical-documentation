import React from 'react';

export default function Link({ children }) {
  return (
    <span
      style={{
        backgroundColor: 'transparent', // No background color
        borderRadius: '2px',
        color: 'blue', // Set text color to blue
        padding: '0.2rem',
        fontWeight: 'bold', // Make font bold
        fontStyle: 'italic', // Make font italic
      }}
    >
      {children}
    </span>
  );
}
