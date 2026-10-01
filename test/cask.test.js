'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('fs');
const path = require('path');
const { execFileSync } = require('child_process');

const CASK = path.join(__dirname, '..', 'Casks', 'quarterdeck.rb');
const source = fs.readFileSync(CASK, 'utf8');

// `brew style` is not run here: it rejects cask files outside a tapped repository.
test('cask is valid Ruby', () => {
  assert.match(execFileSync('ruby', ['-c', CASK], { encoding: 'utf8' }), /Syntax OK/);
});

test('url points at the arm64 zip of the tagged release', () => {
  const url = source.match(/^\s*url "([^"]+)"/m)?.[1];
  assert.equal(
    url,
    'https://github.com/demircraftco/homebrew-quarterdeck/releases/download/v#{version}/Quarterdeck-#{version}-arm64-mac.zip',
  );
});

test('requires Apple silicon', () => {
  assert.match(source, /^\s*depends_on arch: :arm64$/m);
});

test('zap never removes ~/Quarterdeck, the user work folder', () => {
  const zap = source.match(/^\s*zap\b[\s\S]*?\]/m)?.[0];
  assert.ok(zap, 'zap stanza found');
  const paths = [...zap.matchAll(/"([^"]+)"/g)].map((m) => m[1]);
  assert.ok(paths.length > 0, 'zap lists paths');
  // macOS file systems are case-insensitive, so ~/quarterdeck is the same folder.
  for (const p of paths) assert.doesNotMatch(p, /^~\/quarterdeck(\/|$)/i, `zap would delete ${p}`);
});
