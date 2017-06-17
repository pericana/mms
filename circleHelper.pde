ArrayList<Cordinate> getQuarterDownLeftFromLeft (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = radius;
  int y = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc + y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }
  return cords;
}

ArrayList<Cordinate> getQuarterDownLeftFromRight (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int y = radius;
  int x = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (y >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc + y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++x;
      delta += 2 * x + 1;
      continue;
    }
    error = 2 * (delta - x) - 1;
    if (delta > 0 && error > 0) {
      --y;
      delta += 1 - 2 * y;
      continue;
    }
    ++x;
    delta += 2 * (x - y);
    --y;
  }
  return cords;
}

ArrayList<Cordinate> getQuarterDownRightFromLeft (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = 0;
  int y = radius;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (y >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc + x), (float)(yc + y));
    cords.add(mp);

    error = 2 * (delta + y) - 1;
    if (delta < 0 && error <= 0) {
      ++x;
      delta += 2 * x + 1;
      continue;
    }
    error = 2 * (delta - x) - 1;
    if (delta > 0 && error > 0) {
      --y;
      delta += 1 - 2 * y;
      continue;
    }
    ++x;
    delta += 2 * (x - y);
    --y;
  }

  return cords;
}

ArrayList<Cordinate> getQuarterDownRightFromRight (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int y = 0;
  int x = radius;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc + x), (float)(yc + y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }

  return cords;
}

ArrayList<Cordinate> getQuarterUpperRightFromRight (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = radius;
  int y = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc + x), (float)(yc - y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }


  return cords;
}

ArrayList<Cordinate> getQuarterUpperRightFromLeft (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int y = radius;
  int x = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (y >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc + x), (float)(yc - y));
    cords.add(mp);

    error = 2 * (delta + y) - 1;
    if (delta < 0 && error <= 0) {
      ++x;
      delta += 2 * x + 1;
      continue;
    }
    error = 2 * (delta - x) - 1;
    if (delta > 0 && error > 0) {
      --y;
      delta += 1 - 2 * y;
      continue;
    }
    ++x;
    delta += 2 * (x - y);
    --y;
  }


  return cords;
}

ArrayList<Cordinate> getQuarterUpperLeftFromRight (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = 0;
  int y = radius;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (y >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc - y));
    cords.add(mp);

    error = 2 * (delta + y) - 1;
    if (delta < 0 && error <= 0) {
      ++x;
      delta += 2 * x + 1;
      continue;
    }
    error = 2 * (delta - x) - 1;
    if (delta > 0 && error > 0) {
      --y;
      delta += 1 - 2 * y;
      continue;
    }
    ++x;
    delta += 2 * (x - y);
    --y;
  }

  return cords;
}

ArrayList<Cordinate> getQuarterUpperLeftFromLeft (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = radius;
  int y = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc - y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }

  return cords;
}

ArrayList<Cordinate> getCircle (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = radius;
  int y = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {

    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc + y));
    cords.add(mp);
    Cordinate mp2 = new Cordinate((float)(xc + x), (float)(yc + y));
    cords.add(mp2);
    Cordinate mp3 = new Cordinate((float)(xc - x), (float)(yc - y));
    cords.add(mp3);
    Cordinate mp4 = new Cordinate((float)(xc + x), (float)(yc - y));
    cords.add(mp4);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }
  return cords;
}

ArrayList<Cordinate> getFirstForThree (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int x = radius;
  int y = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    if (y >= radius / 1.5) {
      Cordinate mp = new Cordinate((float)(xc - x), (float)(yc - y));
      cords.add(mp);
    }


    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }

  return cords;
}

ArrayList<Cordinate> getSecondForThree (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int y = radius;
  int x = 0;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (y >= radius / 1.5)
  {
    Cordinate mp = new Cordinate((float)(xc - x), (float)(yc + y));
    cords.add(mp);

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++x;
      delta += 2 * x + 1;
      continue;
    }
    error = 2 * (delta - x) - 1;
    if (delta > 0 && error > 0) {
      --y;
      delta += 1 - 2 * y;
      continue;
    }
    ++x;
    delta += 2 * (x - y);
    --y;
  }
  return cords;
}

ArrayList<Cordinate> getFirstForTwo (int xc, int yc, int radius)
{
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int y = 0;
  int x = radius;
  int delta = 2 - 2 * radius;
  int error = 0;

  while (x >= 0)
  {
    if (y <= radius / 1.5) {
      Cordinate mp = new Cordinate((float)(xc + x), (float)(yc + y));
      cords.add(mp);
    }

    error = 2 * (delta + x) - 1;
    if (delta < 0 && error <= 0) {
      ++y;
      delta += 2 * y + 1;
      continue;
    }
    error = 2 * (delta - y) - 1;
    if (delta > 0 && error > 0) {
      --x;
      delta += 1 - 2 * x;
      continue;
    }
    ++y;
    delta += 2 * (y - x);
    --x;
  }

  return cords;
}