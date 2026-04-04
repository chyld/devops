// bun is_project.js

import { $ } from "bun";

const pwd = await $`pwd`.text();
const segments = pwd.split('/');
const response = +((segments[3] === "Projects") && (segments.length === 5));
process.stdout.write(response.toString());

