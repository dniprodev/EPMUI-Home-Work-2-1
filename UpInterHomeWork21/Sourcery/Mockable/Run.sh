ABSPATH="$(cd "$(dirname "$0")" && pwd)"

INPUT="$ABSPATH/Input.swift"
OUTPUT="$ABSPATH/Output.swift"
TEMPLATE="$ABSPATH/AutoMockable.stencil"

cd "$ABSPATH"

echo $INPUT
echo $OUTPUT
echo $TEMPLATE

sourcery --sources $INPUT --templates $TEMPLATE --output $OUTPUT
