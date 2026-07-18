interface Props {
  text: string;
}

/**
 * Renders the seeded article body: blank-line-separated paragraphs, where a
 * paragraph opening with **bold** is treated as a lead-in heading. Deliberately
 * not a full markdown parser — the seeder is the only author.
 */
export function Prose({ text }: Props) {
  const paragraphs = text
    .split(/\n\s*\n/)
    .map((block) => block.trim())
    .filter(Boolean);

  return (
    <div className="prose">
      {paragraphs.map((block, index) => {
        const bold = block.match(/^\*\*(.+?)\*\*\s*(.*)$/s);

        if (bold) {
          return (
            <p key={index}>
              <strong>{bold[1]}</strong> {bold[2]}
            </p>
          );
        }

        return <p key={index}>{block}</p>;
      })}
    </div>
  );
}
